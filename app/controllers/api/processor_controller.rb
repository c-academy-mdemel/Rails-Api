require_relative "Core/tideman"
module Api
    class ProcessorController < ApplicationController
        protect_from_forgery with: :null_session
        def index

            p = JSON.parse(params.to_json)

            puts "----------------------------------------------------"
            puts p;

            cc = p["cc"]
            vc = p["vc"]

            # vc = params["data"]["vc"]
            vs = p["vs"]
            
            test_v = Core::Tideman.new().calculate(cc,vc,JSON.parse(vs.to_json));
            sd = "";
            render json: {status: 'SUCCESS',data: params, data: test_v};

            
        end


        def create

            p = JSON.parse(params.to_json)

            puts "----------------------------------------------------"
            puts p;

            cc = p["cc"]
            vc = p["vc"]

            # vc = params["data"]["vc"]
            vs = p["vs"]
            
            test_v = Core::Tideman.new().calculate(cc,vc,JSON.parse(vs.to_json));
            sd = "";
            render json: {status: 'SUCCESS',data: params, data: test_v};

            
        end
    end
end