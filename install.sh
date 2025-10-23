#!/bin/bash

# # Install .NET
# curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --channel 8.0 --install-dir /usr/share/dotnet \
#   && ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet
# echo "DOTNET_ROOT=/usr/share/dotnet" >> /etc/environment

# Install Python and development tools
apt-get update
apt-get install -y python3 python3-pip python3-venv python3-dev build-essential

# Upgrade pip to latest version
python3 -m pip install --upgrade pip

# Install common Python development tools
pip3 install --upgrade \
    virtualenv \
    pipenv \
    poetry \
    black \
    pylint \
    flake8 \
    autopep8 \
    pytest \
    pytest-cov \
    ipython \
    jupyter \
    notebook \
    jupyterlab

# Set up Python aliases
echo "alias python=python3" >> /home/ace/.bashrc
echo "alias pip=pip3" >> /home/ace/.bashrc

# Add Python to PATH
echo 'export PATH="/usr/local/bin:$PATH"' >> /etc/environment

# Install VS Code extensions for Python
sudo -u ace code-server --install-extension ms-python.python
sudo -u ace code-server --install-extension ms-python.vscode-pylance
sudo -u ace code-server --install-extension ms-python.debugpy
sudo -u ace code-server --install-extension ms-toolsai.jupyter
sudo -u ace code-server --install-extension dbcode.dbcode
sudo -u ace code-server --install-extension brittanychiang.halcyon-vscode
sudo -u ace code-server --install-extension pkief.material-product-icons
sudo -u ace code-server --install-extension eamodio.gitlens

# Create default Python workspace directory
mkdir -p /home/ace/python-projects
chown -R ace:ace /home/ace/python-projects

echo "Python environment setup complete!"
python3 --version
pip3 --version