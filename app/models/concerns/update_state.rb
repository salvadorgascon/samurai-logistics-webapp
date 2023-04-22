# frozen_string_literal: true

module UpdateState
  extend ActiveSupport::Concern

  included do
    before_save do
      if new_record? || (state_was != state)
        if new_record?
          self.states = [{ state: state, status_at: state_at, status_notes: state_notes }]
        else
          self.states << { state: state, status_at: state_at, status_notes: state_notes }
        end
      end
    end
  end
end