require 'pony'
require 'psych'

class TaskMailer

  Basedir = File.expand_path("#{File.dirname(__FILE__)}/..")
  JOBS    = Psych.load_file("#{Basedir}/config/jobs.yaml") unless defined? JOBS 

  ##
  # main
  #
  def initialize
  end

  def email 
    JOBS.each do |job|
      job_name = job.first
      job_data = job.last
      body = get_email_contents(job_data)
      send_email(job_data, body)
    end
  end

  private

  def get_email_contents(job_data)
      output = Array.new
      job_data[:projects].each do |project|
        output.push( invoke_tw(project) )
      end
      return output
  end

  def send_email(job_data, body)
    Pony.mail(
      :to => job_data[:email],
      :from => job_data[:from],
      :subject => job_data[:subject], 
      :body => body,
      :via => :sendmail
    )
  end

  def invoke_tw(project)
    cmd = "task list pro:#{project}"
    return %x(#{cmd})
  end
end
