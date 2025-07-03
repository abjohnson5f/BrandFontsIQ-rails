# Base class for models that connect to Supabase database
class SupabaseRecord < ActiveRecord::Base
  self.abstract_class = true
  
  # Connect to the Supabase database instead of the primary database
  connects_to database: { writing: :supabase, reading: :supabase }
  
  # Disable Rails callbacks and validations for read-only Supabase data
  def readonly?
    true
  end
  
  # Prevent accidental writes
  before_save :prevent_writes
  before_create :prevent_writes
  before_update :prevent_writes
  before_destroy :prevent_writes
  
  private
  
  def prevent_writes
    raise ActiveRecord::ReadOnlyRecord, "Supabase records are read-only"
  end
end