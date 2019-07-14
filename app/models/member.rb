class Member < ActiveRecord::Base
  DATATABLE_COLUMNS = %w[name email phone city postal_code].freeze

  class << self
    def datatable_filter(search_value, search_columns)
      return all if search_value.blank?
      result = where("name ILIKE ? or email ILIKE ? or phone ILIKE ? or city ILIKE ? or postal_code ILIKE ?", "%#{search_value}%","%#{search_value}%","%#{search_value}%","%#{search_value}%","%#{search_value}%")
    end

    def datatable_order(order_column_index, order_dir)
      order("#{Member::DATATABLE_COLUMNS[order_column_index]} #{order_dir}")
    end
  end

  validates :name, presence: true
  validates :postal_code, presence: true
  validates :email, presence: true, email: true, uniqueness: true
#  has_one :administrative_region, primary_key: :postal_code, foreign_key: :postal_code, class_name: "PostalCode"
  before_create :remove_space_from_postal_code
  before_save :remove_spaces_from_email_address
  self.per_page = 30

  def status_full_name
    if status == 'CE'
      "Erreur de courriel"
    elsif status == 'I'
      "Indésirable"
    elsif status == 'D'
      "Désinscription"
    elsif status == 'TE'
      "Téléphone erroné ou inexistant"
    elsif status == 'NLI'
      "No longer interested"
    end
  end

  def self.confirmed
    where("NOT confirmed_at IS NULL")
  end

  def self.unconfirmed
    where("confirmed_at IS NULL")
  end

  def remove_space_from_postal_code
    self.postal_code = self.postal_code.delete(' ')
  end

  def remove_spaces_from_email_address
    self.email = self.email.strip
  end
end
