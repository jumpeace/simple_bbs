require './helper/app/controllers'

class PostController < AppController
  def initialize()
    super('post', %w[message], [])
  end

  def increment_heart(params)
    record = get_main_record(params)
    if record.nil?
      return generate_404_response()
    end

    record.heart += 1
    record.save
    generate_response(
      { 'id' => record.id, 'heart' => record.heart }, 200
    )
  end
end