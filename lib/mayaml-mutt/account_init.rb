# encoding: utf-8

# Copyright (C) 2016 Szymon Kopciewski
#
# This file is part of MayamlMutt.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

require "mustache"

module MayamlMutt
  class AccountInit
    def initialize
      @template = IO.read(File.join(File.dirname(__FILE__), "account_init.mustache"))
    end

    def render(mail_account, config = {})
      ::Mustache.render(
        @template,
        name: mail_account.name,
        clean_name: clean_name(mail_account.name),
        accounts_dir: config.fetch(:accounts_dir, "accounts")
      )
    end

    private

    def clean_name(string)
      string.gsub(/\W/, "_")
    end
  end
end
