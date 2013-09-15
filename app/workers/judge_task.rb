class JudgeTask
  @queue = :judge

  def self.perform(id)
    submission = Submission.find(id)
    code = submission.code
    log = Logger.new 'log/resque.log'

    compile_output = `gcc #{submission.source_path} -o #{submission.exec_path} #{Settings.compiler_options} 2>&1`
    if $?.success?
      problem = submission.problem
      log.debug "#{submission.id} | #{compile_output}"
      msg = `#{Settings.sandbox_path} -i #{problem.input_path} -o #{submission.out_path} -t #{problem.time_limit} -m #{problem.mem_limit} #{submission.exec_path}`

      case msg.strip
      when /(\d+) (\d+) (\d+)/
        submission.time_cost = $2.to_i
        submission.status = self.output_eql?(submission.out_path, problem.ans_path) ? :ac : :wa;
      when 'Time Limit Exceeded'
        submission.status = :tle
        submission.msg = msg
      when 'Memory Limit Exceeded'
        submission.status = :re
        submission.msg = msg
      when 'Program Killed'
        submission.status = :re
        submission.msg = msg
      end

      FileUtils.rm_f(submission.exec_path)
      FileUtils.rm_f(submission.out_path)
    else
      submission.status = :ce
      submission.msg = compile_output.gsub(submission.source_path, 'Your code')
    end

    submission.save
  end

  private

  def self.output_eql?(exec_out, ans_path)
    a = IO.readlines(exec_out).map { |s| s.strip }
    b = IO.readlines(ans_path).map { |s| s.strip }
    a == b
  end

end