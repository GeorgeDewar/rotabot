class Roster < ApplicationRecord
  has_many :assignments

  enum period: { weekly: 1, monthly: 2 }

  def plan
    case period
      when "weekly"
        weeks = [Week.this] + Week.this.next(10)

        for week in weeks
          assignment = assignments.find_by(year: week.year, week_number: week.week)
          unless assignment
            person = least_recent_person
            assignments.create!(person: person, year: week.year, week_number: week.week)
            Rails.logger.info "Assigned #{person.full_name} to Week #{week.week}, #{week.year}"
          end
        end
      when "monthly"
        months = [Month.this] + Month.this.next(10)

        for month in months
          assignment = assignments.find_by(year: month.year, month_number: month.month)
          unless assignment
            person = least_recent_person
            assignments.create!(person: person, year: month.year, month_number: month.month)
            Rails.logger.info "Assigned #{person.full_name} to #{month.name} #{month.year}"
          end
        end
    end
  end

  def least_recent_person
    case period
      when "weekly"
        people = Person.joins("left outer join assignments on people.id = assignments.person_id and assignments.roster_id = #{id}").
            group(:id).maximum("year * 52 + week_number")
        never_assigned = people.select{ |k, v| v.nil? }
        assigned =       people.select{ |k, v| v.present? }
        person_id = never_assigned.present? ? never_assigned.keys.sample : assigned.sort_by {|k,v| v}.first[0]
      when "monthly"
        people = Person.joins("left outer join assignments on people.id = assignments.person_id and assignments.roster_id = #{id}").
            group(:id).maximum("year * 12 + month_number")
        never_assigned = people.select{ |k, v| v.nil? }
        assigned =       people.select{ |k, v| v.present? }
        person_id = never_assigned.present? ? never_assigned.keys.sample : assigned.sort_by {|k,v| v}.first[0]
    end
    Person.find(person_id)
  end
end
