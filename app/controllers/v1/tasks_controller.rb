class V1::TasksController < V1::BaseController
  def execute
    render json: { message: "Success", status: 200 }
  end
end
