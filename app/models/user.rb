class User < ApplicationRecord
  enum role: [:default, :admin]
end
