require 'cgi'
require 'rubygems'
require 'nokogiri'
require 'open-uri'

require 'result'

class Tagme 
  # API to TAGME API
  # 
  # Example:
  #   >> Tagme.new('[API Key]').tag('nano fibers')
  #   => [ #<Result:...>, ... ]
  #
  # Arguments:
  #   api_key: (String)

  API_PATH = 'http://tagme.di.unipi.it/api'

  attr_accessor :api_key, :lang, :referer

  def initialize(api_key, lang='en', referer='')
    @api_key = api_key
    @lang = lang
    @referer = referer
  end
  
  def tag(string)
    params = "?text=#{CGI.escape(string)}&key=#{@api_key}&lang=#{@lang}"
    response = open(API_PATH + params, { 'Referer' => @referer })
    return nil if response.class.superclass == Net::HTTPServerError
    doc = Nokogiri::XML(response)
    doc.xpath('//annotation/spot').zip(
      doc.xpath('//annotation/title'),
      doc.xpath('//annotation/id'),
      doc.xpath('//annotation/rho')
    ).inject([]) do |results, annotation|
      results << Result.new({
        :spot => {
          :pos => annotation[0].attribute('pos').content.to_i,
          :len => annotation[0].attribute('len').content.to_i
        },
        :title => annotation[1].content,
        :wikipedia_id => annotation[2].content.to_i,
        :rho => annotation[3].content.gsub(',', '.').to_f
      })
    end
  end
end

