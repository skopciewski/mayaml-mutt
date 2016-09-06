require "test_helper"
require "mayaml-mutt/account_creds"
require "mayaml/mail_account"

class MayamlMuttAccountCredsTest < Minitest::Test
  def setup
    @account = ::Mayaml::MailAccount.new
    @account.name = "test-name@test.com"
    @account.realname = "Joe Doe"
    @account.server = "test@test.com"
    @account.port = 999
    @account.user = "user"
    @account.pass = "pass"
    @account.mailboxes = %w(a b)
    @generator = ::MayamlMutt::AccountCreds.new
    @config = @generator.render(@account)
  end

  def test_that_template_has_from_line
    assert_match(/^set from="#{@account.name}"/, @config)
  end

  def test_that_template_has_realname_line
    assert_match(/^set realname="#{@account.realname}"/, @config)
  end

  def test_that_template_has_smtp_url_line
    assert_match(
      %r{^set smtp_url="smtp://#{@account.user}@#{@account.server}:#{@account.port}/" smtp_pass="#{@account.pass}"},
      @config
    )
  end
end
