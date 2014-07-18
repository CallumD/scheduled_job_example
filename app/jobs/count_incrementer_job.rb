class CountIncrementerJob
  include ScheduledJob

  def self.time_to_recur(last_run_at)
    Time.now + 3.seconds
  end

  def perform
    run_counter = JobRunCount.first || JobRunCount.create(counter: 0)
    run_counter.counter += 1
    Rails.logger.info("Current count = #{run_counter.counter}")
    run_counter.save!
  end
end
