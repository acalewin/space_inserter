require 'mecab'

class ParserController < ApplicationController
  def index
    params.permit(:text)
    @text = params[:text]
    @spaced_text = nil
    if !@text.nil? and !@text.empty?
      @spaced_text = @text.split(/\n/).map {|s| MeCab::Tagger.new().parse(s).split(/\n/).map {|l| build_element(l)}}
    else
      @text = ""
    end
  end

  private
  def build_element(token)
    term, info = token.split(/\t/)
    stuff = []
    term = '' if term == 'EOS'
    if (info)
      stuff = info.split(/,/)
    end
      
      {
        :term => term,
        :pos => stuff.first
      }
  end
end
