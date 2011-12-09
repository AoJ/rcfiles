require 'sinatra/base'
require 'pp'

class InvoiceServer < Sinatra::Base
  set :entries, []
  set :port, 3000

  get "/" do
    @rate = settings.rate.to_i
    @bille_name = settings.bille_name
    @bille_company = settings.bille_company
    @entries = settings.entries

    erb :index
  end
end

class Timetrap::Formatters::Invoice

  def initialize(entries)
    @entries = entries
  end

  def output
    current_sheet = @entries[0][:sheet]
    data_sheet = Timetrap::Entry.sheets.find_all { |i| i =~ /^#{current_sheet}.+/ }

    return "You need to create a data sheet first" unless data_sheet.length == 1

    data = data_sheet[0].split(',')

    InvoiceServer.set(:rate, data[1])
    InvoiceServer.set(:bille_name, data[2])
    InvoiceServer.set(:bille_company, data[3])
    InvoiceServer.set(:entries, @entries)

    InvoiceServer.run!
  end
end
