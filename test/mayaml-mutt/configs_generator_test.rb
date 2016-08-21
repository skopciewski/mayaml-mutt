require "test_helper"
require "mayaml-mutt/configs_generator"
require "mayaml-mutt/account_init"
require "mayaml-mutt/accounts_alternates"
require "mayaml-mutt/account_creds"
require "mayaml/mail_account"

class MayamlMuttConfigsGenerator < Minitest::Test
  def setup
    account_init = ::MayamlMutt::AccountInit.new
    accounts_alternates = ::MayamlMutt::AccountsAlternates.new
    account_creds = ::MayamlMutt::AccountCreds.new
    @generator = ::MayamlMutt::ConfigsGenerator.new(account_init, accounts_alternates, account_creds)
  end

  def account(name, type = :imap)
    account = ::Mayaml::MailAccount.new
    account.name = name
    account.type = type
    account.server = "test@test.com"
    account.user = "user"
    account.pass = "pass"
    account
  end

  def test_that_init_generator_generates_hash
    accounts = [account("acc1")]
    results = @generator.generates_init(accounts)
    assert_instance_of Hash, results
  end

  def test_that_init_generator_returns_hash_with_right_key
    accounts = [account("acc1")]
    results = @generator.generates_init(accounts)
    assert_equal true, results.key?(accounts.first.name.to_sym)
  end

  def test_that_init_generator_returns_hash_with_alternates_key
    accounts = [account("acc1")]
    results = @generator.generates_init(accounts)
    assert_equal true, results.key?(:alternates)
  end

  def test_that_init_generator_returns_right_alternates_key
    accounts = [account("acc1"), account('acc2')]
    results = @generator.generates_init(accounts)
    assert_match(/^alternates acc1 acc2/, results[:alternates])
  end

  def test_that_init_gernerator_generates_three_configs_for_two_accounts
    accounts = [account("acc1"), account("acc2")]
    results = @generator.generates_init(accounts)
    assert_equal 3, results.count
  end

  def test_that_creds_generator_generates_hash
    accounts = [account("acc1")]
    results = @generator.generates_creds(accounts)
    assert_instance_of Hash, results
  end

  def test_that_creds_generator_returns_hash_with_right_key
    accounts = [account("acc1")]
    results = @generator.generates_creds(accounts)
    assert_equal true, results.key?(accounts.first.name.to_sym)
  end

  def test_that_creds_gernerator_generates_two_configs_for_two_accounts
    accounts = [account("acc1"), account("acc2")]
    results = @generator.generates_creds(accounts)
    assert_equal 2, results.count
  end
end