class ApplicationController < ActionController::API

  def build_error errors
    return {
      errors: errors
    }
  end
end
