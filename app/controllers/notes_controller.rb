class NotesController < ApplicationController
  def index
    @notes = raw_notes.map do |raw_note|
      Note.new(raw_note)
    end
    binding.pry
  end

  private
    def raw_notes
      params[:melody_result][:notes].values
    end
end
