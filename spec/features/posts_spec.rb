feature "Posts" do

  let(:post) { FactoryGirl.build(:post) }

  let!(:post_1) {FactoryGirl.create(:post, created_at: Time.now - 4.days)} #oldest
  let!(:post_2) {FactoryGirl.create(:post, created_at: Time.now - 3.days)} #middle
  let!(:post_3) {FactoryGirl.create(:post, created_at: Time.now - 2.days)} #newest

  #---------------------------------------------------------------------------------------------------------------//
  #NEW POSTS
  #---------------------------------------------------------------------------------------------------------------//
  scenario "new post form displays correctly" do
    visit new_post_path
    expect(page).to have_content "New Post"
    expect(page).to have_content "Post Name"
    expect(page).to have_content "Post Description"
    expect(page).to have_content "Post Image"
  end

  scenario "new post created successfully and redirected to new post /show page" do
    visit new_post_path
    fill_in 'post_name', :with => post.name
    fill_in 'post_description', :with => post.description
    attach_file "post_image_input", 'app/assets/images/test_image.png'
    expect { click_button "Save Post" }.to change { Post.count }.by(1)
    expect(page).to have_content post.name
    expect(page).to have_content post.description
  end

  scenario "new post - blank post name - post not created and error shown" do
    visit new_post_path
    fill_in 'post_name', :with => " " #blank post name, should not pass validation
    fill_in 'post_description', :with => post.description
    attach_file "post_image_input", 'app/assets/images/test_image.png'
    expect { click_button "Save Post" }.to change { Post.count }.by(0)
    expect(page).to have_css("div.alert-error")
    find_field('post_description').value.should eq post.description
  end

  scenario "new post - blank post description - post not created and error shown" do
    visit new_post_path
    fill_in 'post_name', :with => post.name
    fill_in 'post_description', :with => " " #blank post description, should not pass validation
    attach_file "post_image_input", 'app/assets/images/test_image.png'
    expect { click_button "Save Post" }.to change { Post.count }.by(0)
    expect(page).to have_css("div.alert-error")
    find_field('post_name').value.should eq post.name
  end


  scenario "new post - invalid attachment type - post not created and error shown" do
    visit new_post_path
    fill_in 'post_name', :with => post.name
    fill_in 'post_description', :with => post.description
    attach_file "post_image_input", 'app/assets/images/test_text_file.txt' #not a valid image attachment type
    expect { click_button "Save Post" }.to change { Post.count }.by(0)
    expect(page).to have_css("div.alert-error")
    find_field('post_name').value.should eq post.name
    find_field('post_description').value.should eq post.description
  end

  #---------------------------------------------------------------------------------------------------------------//
  #POSTS INDEX
  #---------------------------------------------------------------------------------------------------------------//

  scenario "posts index - posts are displayed correctly and in correct order" do
    visit posts_path
    expect(page).to have_content post_1.name
    expect(page).to have_content post_1.description
    expect(page).to have_content post_2.name
    expect(page).to have_content post_2.description
    expect(page).to have_content post_3.name
    expect(page).to have_content post_3.description

    page.body.index(post_3.name).should < page.body.index(post_2.name) #http://launchware.com/articles/acceptance-testing-asserting-sort-order
  end

  scenario "posts index - new post is created and shown in order for posts index" do
    #new post is created
    visit new_post_path
    fill_in 'post_name', :with => post.name
    fill_in 'post_description', :with => post.description
    attach_file "post_image_input", 'app/assets/images/test_image.png'
    expect { click_button "Save Post" }.to change { Post.count }.by(1)
    expect(page).to have_content post.name
    expect(page).to have_content post.description

    #new post is shown at the top of the posts index
    visit posts_path
    expect(page).to have_content post_1.name
    expect(page).to have_content post_1.description

    page.body.index(post.name).should < page.body.index(post_1.name) #http://launchware.com/articles/acceptance-testing-asserting-sort-order
  end

  #---------------------------------------------------------------------------------------------------------------//
  #EDIT POST
  #---------------------------------------------------------------------------------------------------------------//

  scenario "edit post - successfully edit post" do
    visit edit_post_path(post_1)
    find_field('post_name').value.should eq post_1.name
    find_field('post_description').value.should eq post_1.description
    expect(page).to have_content 'test_image.png'

    fill_in 'post_name', :with => "Edited Name"
    fill_in 'post_description', :with => "Edited Description"
    expect { click_button "Save Post" }.to change { Post.count }.by(0)

    expect(page).to have_content "Edited Name"
    expect(page).to have_content "Edited Description"

  end

  scenario "edit post - successfully edit post and remove image", js:true do
    visit edit_post_path(post_1)
    expect(page).to have_content 'test_image.png'

    find("#post_image_remove_button").click #remove the image

    expect { click_button "Save Post" }.to change { Post.count }.by(0)
    visit edit_post_path(post_1)
    expect(page).to_not have_content "test_image.png"
  end

  #---------------------------------------------------------------------------------------------------------------//
  #DELETE POST
  #---------------------------------------------------------------------------------------------------------------//

  scenario "delete post - successfully delete post" do
    visit post_path(post_1)
    expect { click_link 'Delete Post' }.to change { Post.count }.by(-1)
  end

end