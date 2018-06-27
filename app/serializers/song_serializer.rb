class SongSerializer < ActiveModel::Serializer
  alias :read_attribute_for_serialization :send
  attributes :notes

  def notes(sum_beats=0)
    object.notes.reduce('') do | note_string, note |
      note_string << note.to_abcJS_string
      sum_beats += note.num_beats.to_r.to_f
      note_string << ' | ' if sum_beats % 4 == 0 && sum_beats > 0
      note_string
    end
  end
end
