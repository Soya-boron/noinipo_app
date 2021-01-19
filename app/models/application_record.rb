class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def theme_to_opinions
    @opinions=Opinion.where(theme_id:self.id).order(id: "DESC")
    return @opinions
  end

  def opinion_to_user
    @user=User.find_by(id:self.user_id)
    return @user
  end

  def user_to_opinions
    @opinions=Opinion.where(user_id:self.id).order(id: "DESC")
    return @opinions
  end

  def opinion_to_theme
    @theme=Theme.find_by(id:self.theme_id)
    return @theme
  end

  def user_to_followthemes_data
    @followthemes_data=ThemeFollow.where(user_id:self.id).order(id: "DESC")
    return @followthemes_data
  end

  def followtheme_data_to_theme
    @theme=Theme.find_by(id:self.theme_id)
    @theme
  end

  def self.search_followtheme_data?(userid:,themeid:)
    @followtheme_data=ThemeFollow.find_by(
      user_id: userid,
      theme_id: themeid
    )
    if @followtheme_data
      true
    else
      false
    end
  end

  def user_to_likeopinions_data
    @likeopinions_data=OpinionLike.where(user_id:self.id).order(id: "DESC")
    @likeopinions_data
  end

  def likeopinion_data_to_opinion
    @opinion=Opinion.find_by(id:self.opinion_id)
    @opinion
  end

  def self.search_likeopinion_data?(userid:,opinionid:)
    @likeopinion_data=OpinionLike.find_by(
      user_id: userid,
      opinion_id: opinionid
    )
    if @likeopinion_data
      true
    else
      false
    end
  end

  def likecount
    likecount = OpinionLike.where(opinion_id:self.id).count
    likecount
  end

  def followcount
    followcount = ThemeFollow.where(theme_id:self.id).count
    followcount
  end

  def opinioncount
    opinioncount = Opinion.where(theme_id:self.id).count
    opinioncount
  end
end