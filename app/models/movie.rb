# frozen_string_literal: true

class Movie < ApplicationRecord
  has_many :bookmarks
  has_many :lists, through: :bookmarks

  validates :title, :overview, uniqueness: true, presence: true
end
