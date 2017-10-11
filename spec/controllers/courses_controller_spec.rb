require 'rails_helper'

RSpec.describe CoursesController do
  # index
  describe "GET index" do
    it "assigns @courses and render" do
      course1 = create(:course)
      course2 = create(:course)

      get :index

      expect(assigns[:courses]).to eq([course1, course2])
    end
    it "render template" do
      course1 = create(:course)
      course2 = create(:course)

      get :index

      expect(response).to render_template("index")
    end
  end

  # show
  describe "GET show" do
    it "assigns @course" do
      course = create(:course)

      get :show, params: { id: course.id }

      expect(assigns[:course]).to eq(course)
    end

    it "render template" do
      course = create(:course)

      get :show, params: { id: course.id }

      expect(response).to render_template("show")
    end
  end

  # new
  describe "GET new" do
    context "when user login" do
      let(:user) {create(:user)}
      let(:course) {build(:course)}
      before do
        sign_in user
        get :new
      end
      it "assign @courses" do

        expect(assigns(:course)).to be_a_new(Course)
      end

      it "render template" do

        expect(response).to render_template("new")
      end
    end

    context "when user not login" do
      it "redirect to new_user_session_path" do
        get :new
        expect(response).to redirect_to new_user_session_path
      end
    end

  end

  # create
  describe "POST create" do
    context "when course doesn't have a title" do
      it "doesn't create a new course record" do

        expect do
          post :create, params: {:course => {:descriptoin => "bar"}}
        end.to change{ Course.count }.by(0)
      end

      it "render new template" do

        post :create, params: {:course => {:descriptoin => "bar"}}

        expect(response).to render_template("new")
      end
    end

    context "when course has a title" do
      it "create a new course record when course has a title" do
        course = build(:course)

        expect do
          post :create, params: {:course => attributes_for(:course)}
        end.to change{ Course.count }.by(1)
      end

      it "redirects to courses_path when course has title" do
        course = build(:course)

        post :create, params: {:course => attributes_for(:course)}

        expect(response).to redirect_to courses_path
      end
    end

  end

  # edit
  describe "GET edit" do
    it "assign @course" do
      course = create(:course)

      get :edit, :id => course.id

      expect(assigns(:course)).to eq(course)
    end

    it "render template" do
      course = create(:course)

      get :edit, :id => course.id
      expect(response).to render_template("edit")
    end
  end

  # update
  describe "PUT update" do
    context "when course has title" do
      it "assign @course" do
        course = create(:course)

        put :update, params: {id: course.id, course: {title: "Title", description: "Description."}}

        expect(assigns[:course]).to eq(course)
      end

      it "change value" do
        course = create(:course)

        put :update, params: {id: course.id, course: {title: "Title", description: "Description."}}
        expect(assigns[:course].title).to eq("Title")
        expect(assigns[:course].description).to eq("Description.")
      end

      it "redirects to courses path" do
        course = create(:course)

        put :update, params: {id: course.id, course: {title: "Title", description: "Description."}}

        expect(response).to redirect_to courses_path
      end
    end

    context "when course doesn't have title" do
      # it "doesn't update a record" do
      #   course = create(:course)
      #
      #   put :update, params: {id: course.id, course: { title: "", description: "Description"}}
      #
      #   expect(assigns[:course].description).not_to eq("Description")
      # end

      it "render edit template" do
        course = create(:course)

        put :update, params: {id: course.id, course: {title: "", description: "Description."}}

        expect(response).to render_template("edit")
      end
    end

  end

  # delete
  describe "DELETE destroy" do
    it "assign @course" do
      course = create(:course)

      delete :destroy, :id => course.id

      expect(assigns(:course)).to eq(course)
    end

    it "delete a record" do
      course = create(:course)

      expect {delete :destroy, id: course.id}.to change {Course.count}.by(-1)

    end

    it "redirect to courses path" do
      course = create(:course)

      delete :destroy, :id => course.id
      expect(response).to redirect_to courses_path
    end
  end

end
