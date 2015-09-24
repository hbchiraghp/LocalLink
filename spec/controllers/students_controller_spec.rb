require 'spec_helper'

describe StudentsController, :type => :controller do
  let(:student) { FactoryGirl.create :student }
  
  before(:each) do
    request.env["HTTP_REFERER"] = root_path
  end

  context "Student Page Access" do

    it "POST /create" do
      expect {
        post :create, {
          "student" => {
            "first_name" => "test",
            "last_name" => "student",
            "enroll_no" => "testXX12345a",
            "email" => "test-student@mailinator.com",
            "gender" => 'male',
            "date_of_birth" => '06-06-1986',
            "phone" => '079-1234-6575',
            "address1"=>"Test1",
            "address2"=>"Test1",
            "city"=>"Newyork",
            "country"=>"USA",
            "postcode"=>"752158"

          },
        }
      }.to change{
        Student.count
      }.by(1)
    end

    it "GET /new" do
      get :new
      response.should be_success
    end

    it "DELETE /:id" do
      delete :destroy, id: student.id
      response.should be_redirect
    end

    it "PUT /update" do
      put :update, {
        "student" => {
          "first_name" => "test1",
          "last_name" => "student",
          "city"=>"Newyork",
          "country"=>"USA",
          "postcode"=>"752158"
        },
        "id" => student.id,
      }

      student.reload
      student.first_name.should == "test1"
    end

    it "GET /edit" do
      get :edit, id: student.id
      response.should be_success
    end

  end  
end
