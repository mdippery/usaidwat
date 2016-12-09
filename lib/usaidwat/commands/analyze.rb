require 'rainbow'
require 'redcarpet'
require 'redcarpet/render_strip'
require 'sentimental'
require 'usaidwat/ext/string'

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
        comments = redditor.comments.map { |c| markdown.render(c.body) }
        all_comments = comments.join("\n")

        sentiments = Hash.new(0)

        analyzer = Sentimental.new
        analyzer.load_defaults

        page
        comments.each_with_index do |c, i|
          puts unless i == 0
          score = analyzer.score(c)
          sentiment = analyzer.sentiment(c)
          sentiments[sentiment] += 1
          score_label = Rainbow(sprintf("[%.2f]", score)).yellow
          puts "#{c.chomp} #{smiley(sentiment)} #{score_label}"
        end

        puts
        [:positive, :negative, :neutral].each do |s|
          c = sentiments[s]
          puts "#{c} #{s} #{'comment'.pluralize(c)}"
        end
      end

      private

      def markdown
        @renderer ||= Redcarpet::Markdown.new(Redcarpet::Render::StripDown)
      end

      def smiley(sentiment)
        case sentiment
        when :neutral  then Rainbow(':-|').black.bright
        when :positive then Rainbow(':-)').green
        when :negative then Rainbow(':-(').red
        end
      end
    end
  end
end
