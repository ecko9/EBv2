class AddParticipantIdAndEventIdToParticipations < ActiveRecord::Migration[5.2]
  def change
    add_reference :participations, :participant, index: true
    add_reference :participations, :event, index: true
  end
end
