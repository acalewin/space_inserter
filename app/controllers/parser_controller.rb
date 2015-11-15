require 'mecab'

class ParserController < ApplicationController
  def index
    params.permit(:text)
    @text = params[:text]
    @spaced_text = nil
    if !@text.nil? and !@text.empty?
      @spaced_text = @text.split(/\n/).map {|s| MeCab::Tagger.new().parse(s).split(/\n/).map {|l| l.split}.keep_if {|x| x.size > 1}.map {|e| e[0]} .join(' ')}.join("\n")
    else
      @text = ""
    end
  end

end
