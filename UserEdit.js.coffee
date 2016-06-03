window.UserEdit = class UserEdit extends Support.CompositeView
  _initAvatar: (avatarFileName) =>
    $fileInput = @$(".updateAvatar")
    avatarPrompt = 'Change profile picture'

    $fileInput.fileupload(
      type: 'PUT'
      dataType: 'json'
      done: (evt, data) =>
        $img = @$(".imageContainer img")
        $img.attr("src", data.result.user.avatar_large)
    )

    $uploader = ImageField.new({
      uploadUrl: '<%= update_avatar_user_path(@user) %>',
      fieldName: 'avatar',
      editEnabled: true
    })