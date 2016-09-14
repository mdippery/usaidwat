require 'snooby'

module Snooby
  # Copied from snooby gem so we can fix Paths constant to use Reddit's
  # https URLs. Ugly solution, but it'll work until snooby is fixed.
  remove_const(:Paths)
  paths = {
    :comment            => 'api/comment',
    :compose            => 'api/compose',
    :delete             => 'api/del',
    :disliked           => 'user/%s/disliked.json',
    :friend             => 'api/friend',
    :hidden             => 'user/%s/hidden.json',
    :liked              => 'user/%s/liked.json',
    :login              => 'api/login/%s',
    :me                 => 'api/me.json',
    :post_comments      => 'comments/%s.json',
    :reddit             => '.json',
    :saved              => 'saved.json',
    :subreddit_about    => 'r/%s/about.json',
    :subreddit_comments => 'r/%s/comments.json',
    :subreddit_posts    => 'r/%s.json',
    :subscribe          => 'api/subscribe',
    :unfriend           => 'api/unfriend',
    :user               => 'user/%s',
    :user_about         => 'user/%s/about.json',
    :user_comments      => 'user/%s/comments.json',
    :user_posts         => 'user/%s/submitted.json',
    :vote               => 'api/vote'
  }
  Paths = paths.merge(paths) { |k, v| "https://www.reddit.com/#{v}" }
end
