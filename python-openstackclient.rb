require 'formula'

class PythonOpenstackclient < Formula
  homepage 'https://github.com/openstack/python-novaclient'
  url 'https://github.com/openstack/python-novaclient'

  depends_on :python
  depends_on 'python-pbr'

  resource 'pynovaclient' do
    url 'https://pypi.python.org/packages/source/p/python-novaclient/python-novaclient-2.15.0.tar.gz'
    sha1 'c0ec5587fd32266dadee45adf77cf7b972ee95fa'
  end

  resource 'pyneutronclient' do
    url 'https://pypi.python.org/packages/source/p/python-neutronclient/python-neutronclient-2.3.3.tar.gz'
    sha1 '862c39f08ef830e4c16997b34bd462c40f3f5e36'
  end

  resource 'pykeystoneclient' do
    url 'https://pypi.python.org/packages/source/p/python-keystoneclient/python-keystoneclient-0.4.1.tar.gz'
    sha1 '8abdd849c92a692bc266a49dade6ed6b27681ca3'
  end

  resource 'pyglanceclient' do
    url 'https://pypi.python.org/packages/source/p/python-glanceclient/python-glanceclient-0.12.0.tar.gz'
    sha1 '434f7f5b57e687ba1c7f98c4095c8acc6a36cadc'
  end

  resource 'pyswiftclient' do
    url 'https://pypi.python.org/packages/source/p/python-swiftclient/python-swiftclient-1.8.0.tar.gz'
    sha1 'c962072e5d01a0c629685a434ee657df2901e2cc'
  end

  resource 'pycinderclient' do
    url 'https://pypi.python.org/packages/source/p/python-cinderclient/python-cinderclient-1.0.7.tar.gz'
    sha1 'be713f8b70df6917f76c0ddabd083c7cce7c87fe'
  end

  def install
    resource('pynovaclient').stage { system "python", "setup.py", "install", "--prefix=#{prefix}" }
    resource('pyneutronclient').stage { system "python", "setup.py", "install", "--prefix=#{prefix}" }
    resource('pykeystoneclient').stage { system "python", "setup.py", "install", "--prefix=#{prefix}" }
    resource('pyglanceclient').stage { system "python", "setup.py", "install", "--prefix=#{prefix}" }
    resource('pyswiftclient').stage { system "python", "setup.py", "install", "--prefix=#{prefix}" }
    resource('pycinderclient').stage { system "python", "setup.py", "install", "--prefix=#{prefix}" }
  end

  test do
    system "#{bin}/nova", "--version"
    system "#{bin}/neutron", "--version"
    system "#{bin}/keystone", "--version"
    system "#{bin}/glance", "--version"
    system "#{bin}/swift", "--version"
    system "#{bin}/cinder", "--version"
  end
end
