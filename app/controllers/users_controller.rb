class UsersController < ApplicationController
  before_action :set_current_user, only: [:new, :edit, :update, :schedule, :schedule_reg]


    def login  
    end

    def login_chk
      @user = User.find_by(mail_address: params[:mail_address], password: params[:password])
      if @user
        session[:user_id] = @user.id
        flash[:notice] = "ログインしました"
        redirect_to("/users/#{@user.id}/show")
      else
        flash[:notice] = "ログインに失敗しました"
        @email = params[:email]
        @password = params[:password]
        render :login # login アクションに対応するビューを表示
      end
    end
    
    def new

    end
  
    def createuser
      @user = User.new(name: params[:name], mail_address: params[:mail_address], password: params[:password], weight: params[:weight], hight: params[:hight])
      if @user.save
        flash[:notice] = "ユーザー登録が完了しました"
        redirect_to("/users/#{@user.id}/show")
      else
        render("users/new")
      end
    end
  

    def show
      @user = User.find_by(id: params[:id])
      @training_result = TrainingResult.find_by(user_id: @user.id)

      if @training_result
        @chart_data = {
          "ベンチプレス" => @training_result.bench_press,
          "デッドリフト" => @training_result.deadlift,
          "バーベルスクワット" => @training_result.barbell_squat,
          "ダンベルアームカール" => @training_result.dumbbell_arm_curl,
          "懸垂" => @training_result.pullup
        }
      else
        @chart_data = {}
      end
    end
  
    def date
      @user = User.find_by(id: params[:id])
      @training_result = TrainingResult.find_by(user_id: @user.id)

    if @training_result.nil?
    # データが存在しない場合 → 新規登録画面
    render("users/date")
    else
    # データが存在する場合 → 編集画面
    redirect_to("/users/#{@user.id}/edit")
    end
    end 

    def date_reg
      @training_result = TrainingResult.new(
        user_id: session[:user_id],
        bench_press: params[:bench_press],
        deadlift: params[:deadlift],
        barbell_squat: params[:barbell_squat],
        dumbbell_arm_curl: params[:dumbbell_arm_curl],
        pullup: params[:pullup]
      )
  
      if @training_result.save
        flash[:notice] = "トレーニング結果を登録しました"
        redirect_to("/users/#{session[:user_id]}/show")
      else
        flash[:error] = "登録に失敗しました"
        render("users/date")
      end
    end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @training_result = TrainingResult.find_by(user_id: @user.id)
  
    if @training_result.update(
         bench_press: params[:bench_press],
         deadlift: params[:deadlift],
         barbell_squat: params[:barbell_squat],
         pullup: params[:pullup],
         dumbbell_arm_curl: params[:dumbbell_arm_curl]
       )
      flash[:notice] = "データを更新しました"
      redirect_to("/users/#{@user.id}/show")
    else
      flash[:alert] = "更新に失敗しました"
      render("users/edit")
    end
  end

  def schedule
    @user = User.find_by(id: params[:id])
    @menus = MasterMenu.all
  
    # @menus が nil または空の場合、エラーメッセージを表示する
    if @menus.nil? || @menus.empty?
      flash[:error] = "メニューが登録されていません。"
    end
  end

  def schedule_reg
    @schedule_reg = Schedule.new(
      user_id: session[:user_id],
      youbi_kbn: params[:youbi_kbn],
      menu_id: params[:menu_id],
      menu_rep: params[:menu_rep],
      count: params[:count],
      weight: params[:weight]
    )
  
    if @schedule_reg.save
      flash[:notice] = "スケジュールを登録しました"
      redirect_to("/users/#{session[:user_id]}/show")
    else
      flash[:error] = "スケジュール登録に失敗しました"
      flash[:error] += " - " + @schedule_reg.errors.full_messages.to_sentence
      render("users/schedule")
    end
  end

  def chart
  end

  def set_current_user
    @user = User.find_by(id: session[:user_id])
  end


end
