# config/initializers/monkeypatches.rb
#
# This fixes what seems to be a bug introduced by
# https://github.com/rails/rails/pull/37770
# "Modify ActiveRecord::TestFixtures to not rely on AS::TestCase:"
#
module ActiveRecord::TestFixtures
    def run_in_transaction?
      use_transactional_tests &&
        !self.class.uses_transaction?(method_name) # this monkeypatch changes `name` to `method_name`
    end
  end