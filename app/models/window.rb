class Window
  def initialize(user)
    @user = user
  end

  def known_to_self
    return [] if @user.assignments == []
    self_eval = @user.assignments
      .where(receiver_id: @user.id)
      .first

    return [] if self_eval.nil?

    Adjective.joins(:johari_attributes)
      .joins(:assignments)
      .where("assignments.giver_id = #{@user.id} AND assignments.receiver_id = #{@user.id}")
      .distinct
  end

  def known_to_others
    assignments = Assignment.where(receiver_id: @user.id)
      .where.not(giver_id: @user.id)

    return [] if assignments == []

    Adjective.joins(:johari_attributes)
      .joins(:assignments)
      .where("assignments.receiver_id = #{@user.id}")
      .where.not("assignments.giver_id = #{@user.id}")
      .distinct
  end

  def known_to_either
    Adjective.joins(:johari_attributes)
      .joins(:assignments)
      .where("assignments.receiver_id = #{@user.id}")
      .distinct
  end

  def all_adjectives
    Adjective.all
  end

  def arena_adjectives
    known_to_self & known_to_others
  end

  def blind_spot_adjectives
    known_to_others - known_to_self
  end

  def facade_adjectives
    known_to_self - known_to_others
  end

  def unknown_adjectives
    all_adjectives - known_to_either
  end
end
