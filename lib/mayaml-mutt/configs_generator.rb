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

module MayamlMutt
  class ConfigsGenerator
    def initialize(init_templater, alternates_templater, creds_templater)
      @init_templater = init_templater
      @alternates_templater = alternates_templater
      @creds_templater = creds_templater
    end

    def generates_init(accounts)
      alternates = []
      accounts.each_with_object({}) do |mail_account, result|
        key = mail_account.name.to_sym
        alternates << mail_account.name
        result[key] = @init_templater.render(mail_account)
        result[:alternates] = @alternates_templater.render(alternates)
        result
      end
    end

    def generates_creds(accounts)
      accounts.each_with_object({}) do |mail_account, result|
        key = mail_account.name.to_sym
        result[key] = @creds_templater.render(mail_account)
        result
      end
    end
  end
end
