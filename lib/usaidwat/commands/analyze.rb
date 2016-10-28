require 'redcarpet'
require 'redcarpet/render_strip'
require 'sentimental'

module USaidWat
  module Application
    class Analyze < Command
      def initialize(prog)
        prog.command(:analyze) do |c|
          c.action do |args, options|
            process(options, args)
          end
        end
        super
      end

      def process(options, args)
        raise ArgumentError.new('You must specify a username') if args.empty?
        username = args.shift

        redditor = client.new(username)
        renderer = Redcarpet::Markdown.new(Redcarpet::Render::StripDown)
        comments = redditor.comments.map { |c| renderer.render(c.body) }
        all_comments = comments.join("\n")

        analyzer = Sentimental.new
        analyzer.load_defaults

        comments.each do |c|
          printf "%.2f\n", analyzer.score(c)
        end
      end
    end
  end
end
