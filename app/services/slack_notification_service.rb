class SlackNotificationService
  def initialize
    @client = Slack::Web::Client.new
    test_authorization
  end

  def call(username, message)
    user_id = find_user_id(username)
    dm_channel = open_dm_channel(user_id)
    send_message(dm_channel.id, message)
  end

  private

  def send_message(channel_id, message)
    @client.chat_postMessage(
      channel: channel_id,
      text: message,
      icon_emoji: ':fork_and_knife:'
    )
  end

  def find_user_id(username)
    user_list = @client.users_list
    users = user_list.members.select { |member| member.profile.email == username }
    raise ArgumentError, "Couldn't find a user with that email" if users.empty?
    users.first.id
  end

  def open_dm_channel(user_id)
    request = @client.im_open(user: user_id)
    request.channel
  end

  def test_authorization
    @client.auth_test
  end
end
