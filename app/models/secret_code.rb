class SecretCode < ApplicationRecord
  # Associations
  belongs_to :user, optional: true

  # Delegators
  delegate :email, to: :user, prefix: 'user', allow_nil: true

  # Scopes
  scope :unrelated, -> { where(user_id: nil) }

  # Callbacks
  before_create :set_code_string, unless: :code_string?

  # def find_ptype
  #   -> (column, formated_value) { 
  #     # where("position_positions.data->>'ptype' = ?", "%#{formated_value}%")
  #     where("payload->>'kind' = ?", "%#{formated_value}%")
  #   }
  # end

  scope :find_ptype, ->(column, formated_value){ 
    where("payload->>'kind' LIKE ?", "%#{formated_value}%")
  }

  private

  def set_code_string
    self.code_string = SecureRandom.uuid
  end

end
