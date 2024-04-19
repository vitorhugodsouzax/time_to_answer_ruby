module UsersBackofficeHelper

    def avatar_url
        avatar = current_user.user_profille.avatar
        avatar.attached? ? avatar : 'img.jpg'
     end
end
    