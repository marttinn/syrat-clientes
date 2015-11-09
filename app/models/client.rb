class Client < ActiveRecord::Base
  before_create :assign_unique_repair_id

  private

    def assign_unique_repair_id
      self.unique_repair_id = SecureRandom.hex(20)
    end
end
