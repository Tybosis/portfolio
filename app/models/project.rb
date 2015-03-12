class Project < ActiveRecord::Base
  validates :title, presence: true,
                    length: { in: 5..255,
                              too_short: "Title is too short. Come up with a better title!"
                            }
  validates :technologies_used, presence: true, length: { in: 3..255 }
end
