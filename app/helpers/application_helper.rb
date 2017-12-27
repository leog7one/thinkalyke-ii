module ApplicationHelper

	def time_format(thought_date)
		thought_date.strftime("%A, %b %e %Y %l:%M %p ")
	end

	def thought_status(thought)
		if thought.end_date <= Date.today
			content_tag(:span, "", class: "past")
		else
			content_tag(:span, "", class: "upcoming")
		end
	end
end
