# frozen_string_literal: true

require "rails_helper"

# We make sure that the checksum of the file overriden is the same
# as the expected. If this test fails, it means that the overriden
# file should be updated to match any change/bug fix introduced in the core
checksums = [
  {
    package: "decidim-core",
    files: {
      # layouts
      "/app/views/layouts/decidim/_mini_footer.html.erb" => "55a9ca723b65b8d9eadb714818a89bb3",
      "/app/forms/translatable_presence_validator.rb" => "a0dfc39805f27769edb917e9d30a8d67"
    }
  },
  {
    package: "decidim-blogs",
    files: {
      "/app/views/decidim/blogs/posts/_posts.html.erb" => "933daac39f2b55354d4c5eb4d898de2d"
    }
  },
  {
    package: "decidim-participatory_processes",
    files: {
      "/app/controllers/decidim/participatory_processes/participatory_process_groups_controller.rb" => "1e564390ba85cc83aaef2a75b91c3b7f"
    }
  }
]

describe "Overriden files", type: :view do
  # rubocop:disable Rails/DynamicFindBy
  checksums.each do |item|
    spec = ::Gem::Specification.find_by_name(item[:package])

    item[:files].each do |file, signature|
      it "#{spec.gem_dir}#{file} matches checksum" do
        expect(md5("#{spec.gem_dir}#{file}")).to eq(signature)
      end
    end
  end
  # rubocop:enable Rails/DynamicFindBy

  private

  def md5(file)
    Digest::MD5.hexdigest(File.read(file))
  end
end
