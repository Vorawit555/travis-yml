describe Travis::Yml do
  accept 'addon: ssh_known_hosts' do
    describe 'given a seq of secures' do
      yaml %(
        addons:
          ssh_known_hosts:
          - secure: #{secure}
      )
      it { should serialize_to addons: { ssh_known_hosts: [{ secure: secure }] } }
      it { should_not have_msg }
    end

    describe 'given a seq of strs' do
      yaml %(
        addons:
          ssh_known_hosts:
          - git.foo.org
          - git.foo.com
      )
      it { should serialize_to addons: { ssh_known_hosts: ['git.foo.org', 'git.foo.com'] } }
      it { should_not have_msg }
    end

    describe 'given a secure' do
      yaml %(
        addons:
          ssh_known_hosts:
            secure: #{secure}
      )
      it { should serialize_to addons: { ssh_known_hosts: [{ secure: secure }] } }
      it { should_not have_msg }
    end

    describe 'given a str' do
      yaml %(
        addons:
          ssh_known_hosts: git.foo.org
      )
      it { should serialize_to addons: { ssh_known_hosts: ['git.foo.org'] } }
      it { should_not have_msg }
    end
  end
end
