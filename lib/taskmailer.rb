require 'pony'
require 'psych'
require 'ruote'

class TaskMailer

  Basedir = File.expand_path("#{File.dirname(__FILE__)}/..")
  JOBS    = Psych.load_file("#{Basedir}/config/jobs.yaml") unless defined? JOBS 

  ##
  # main
  #
  def initialize
    print_jobs
  end
  
  private 

  def print_jobs
    JOBS.each do |job|
      p job
    end
  end
end
