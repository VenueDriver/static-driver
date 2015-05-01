class AdminController < ApplicationController

  # Right now there is no web admin, the app only exists to handle forms posted from static
  # sites and GitHub commit hooks.  If a human visits the web app then they should be denied,
  # until maybe some day we might add a real admin section.  Right now the Rails console is
  # the admin section.
  def index
    head :forbidden
  end

end
