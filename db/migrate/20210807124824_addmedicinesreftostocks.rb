class Addmedicinesreftostocks < ActiveRecord::Migration[6.1]
  def change
    add_reference :stocks, :medicines, null: false, foreign_key: true
  end
end
