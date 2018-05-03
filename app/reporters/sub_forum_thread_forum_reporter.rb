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
    Reporter.pdf_temp_path "Forum_Report"
  end

  def self.reportThread(thread_forum, dayInit, dayEnd)
    @game = thread_forum.sub_forum.game
    @sub_forum = thread_forum.sub_forum
    answer = Array.new
    unit = 1.day
    while dayInit <= dayEnd
      answer.push(thread_forum.comments.getCommentByDay(dayInit, thread_forum).count)
      dayInit = dayInit + unit
    end
    
    series = []
    series << Prawn::Graph::Series.new([4,9,3,2,1,6,2,8,2,3,4,9,2],  title: "A label for a series", type: :bar)
    xaxis_labels = ['0900']
    theme = Prawn::Graph::Theme.new({
              series:
                [
                  'EBEDEF',
                  'D6DBDF', 
                  '85929E', 
                  '34495E', 
                  '1B2631' 
                ], 
              title:'17202A', 
              background:'FFFFFF', 
              grid:'F2F4F4', 
              axes:'17202A', 
              markers:'34495E', 
              stroke_grid_lines:true, 
              default:'333333', 
              average:'34495E', 
              max:'17202A',
              min:'17202A' 
            })
    file_name = pdf_temp_path + @game.gam_name + '_' + @sub_forum.sf_name + '_' +
                thread_forum.thr_name + Time.now.strftime("%Y%m%d%H%M%S") + '.pdf'
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
      a = 58 + (answer.length * 28)
      graph series, width: 500, height: 200, title: "Comments Per Day", at: [10,a],theme: theme, xaxis_labels: xaxis_labels
    end

    file_name[7..-1]
  end
end
