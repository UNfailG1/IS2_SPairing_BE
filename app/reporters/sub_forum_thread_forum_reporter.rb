class SubForumThreadForumReporter

  #Create a report of an specific Thread
  #param thread_forum is the thread_forum to be reported
  def self.createThreadReport(thread_forum)

  end

  #Create a report of a complete subforum
  #param subforum is the subforum to be reported
  #limit is the max number of comments per threads on the subforum
  def self.createForumReport(thread_forum, limit)

  end

  private

  #Defines the path to be used on the reporter
  def self.pdf_temp_path
    'tmp/PDFs/Forum Report/'
  end

  def self.reportThread(thread_forum)
    @game = thread_forum.sub_forum.game
    @sub_forum = thread_forum.sub_forum
    file_name = pdf_temp_path + @game.gam_name + '_' + @sub_forum.sf_name + '_' + thread_forum.thr_name + '_report.pdf'
    Prawn::Document.generate(file_name) do
      image "#{Rails.root}/assets/pdf_back.jpg", at: [-50, 900], fit: [700, 1000]
      text thread_forum.thr_name + " report", align: :center, size: 20
      text ' '
      text 'thread_forum names: ' + thread_forum.thr_name, size: 16
      text 'Number of views: ' + thread_forum.thr_views.to_s, size: 16
      text 'Number of comments: ' + thread_forum.thr_comments.to_s, size: 16
      text ' '
      thread_forum.comments.each do |comment|
          text '  Player: ' + comment.player_profile.pp_username, size:14
          text '  Comment: ' + comment.com_comment, size: 14
          text ' '
      end
    end
  end
end
