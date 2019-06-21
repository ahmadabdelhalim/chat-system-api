module ErrorHandler
  def self.included(klass)
    klass.class_eval do

      rescue_from StandardError do |e|
        puts e
        puts e.backtrace.join('\n')
        respond(:standard_error, 500, 1000, "Internal Server Error")
      end

      rescue_from ActiveRecord::RecordNotFound do |e|
        respond(:record_not_found, 404, 1001, e.message)
      end

      rescue_from ActiveRecord::RecordNotSaved, ActiveRecord::RecordInvalid do |e|
        respond(:unprocessable_entity, 422, 1002, e.record.errors.full_messages.join(', '))
      end
    end
  end

  private

  def err_message(e)
    return e.message if e.messages.nil?
    e.messages
  end

  def respond(error, status, code, message)
    render :json => {response_type: "ERROR",
                      response_code: code,
                      error: error,
                      message: message,
                      status: status }, :status => status
  end
end

