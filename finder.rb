module OkCuGit

  class Finder
    def initialize(repo_name)
      @repo_name = "git@github.com:#{repo_name}"
      @dir_name  = repo_name.gsub(/.*\//, './')
      `git clone -q "#{@repo_name}"`
    end

    def all_contributors
      `cd "#{@dir_name}"
       git log --format="<%an> %ae"`.split("\n").uniq.sort
    end

    def close
      `rm -Rf "#{@dir_name}"`
    end
  end
end
