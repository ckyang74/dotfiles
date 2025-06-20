#!/usr/bin/python

import os
import shutil
import subprocess
import sys
import yaml

_conf_dir = "~/.config"
_conf_file = "dev_config.yaml"
_backup_extension = "bak"

_home_dir = os.path.expanduser("~")

_head_comment = """## Dev environment configuration.
#
# Example:
#
# dotfiles:
# - source_file: _dot_bashrc
#   destination_file: path/to/link/destination
#   action_type: symlink
#
# suggestions:
# - destination_file: .vimrc.local
#   description: Put your machine specific VIM settings here
"""


def _install_dotfiles(dotfiles):
  for entry in dotfiles:
    src_path = "%s/%s" %(os.getcwd(), entry["source_file"])
    dest_path = "%s/%s" %(_home_dir, entry["destination_file"])
    _remove_dest_soft_link(dest_path)
    _move_orig_as_bak(dest_path)
    _handle_file(src_path, dest_path, entry["action_type"])


def _validate_conf(data):
  if not data:
    sys.stderr.write("Config file is empty. conf file: %s\n" %conf_filepath)
    exit(0)

  assert isinstance(data, dict)
  assert "dotfiles" in data
  assert "suggestions" in data

  existing_dotfiles = set()
  for file in os.listdir("."):
    if file.startswith("_"):
      existing_dotfiles.add(file)

  for entry in data["suggestions"]:
    assert isinstance(entry, dict)
    assert "destination_file" in entry
    assert "description" in entry

  for entry in data["dotfiles"]:
    assert isinstance(entry, dict)
    assert "source_file" in entry
    assert "destination_file" in entry
    assert "action_type" in entry
    assert entry["action_type"] in ["copy", "symlink"]

    dest_path = "%s/%s" %(_home_dir, entry["destination_file"])
    parent_path = os.path.split(dest_path)[0]
    if not os.path.exists(parent_path):
      sys.stderr.write("Parent dir for destination file does not exist.\n"
          "\tdestination file: %s\n"
          "\tfull path: %s\n" %(entry["destination_file"], dest_path))
      exit(1)

  defined_dotfiles = set()
  for entry in data["dotfiles"]:
    assert entry["source_file"] in existing_dotfiles
    defined_dotfiles.add(entry["source_file"])

  if defined_dotfiles != existing_dotfiles:
    defined_but_not_exist = defined_dotfiles - existing_dotfiles
    for f in defined_but_not_exist:
      sys.stderr.write("File %s defined but does not exist\n" %f)
    exit(1)


def _remove_dest_soft_link(filepath):
  if not os.path.islink(filepath):
    return
  os.remove(filepath)
  sys.stderr.write("Removed existing symlink: %s\n" %filepath)


def _remove_dest_file(filepath):
  if not os.path.isfile(filepath):
    return
  os.remove(filepath)
  sys.stderr.write("Removed existing file: %s\n" %filepath)


def _move_orig_as_bak(filepath):
  i = 2
  if os.path.exists(filepath):
    backup_filepath = "%s.%s" %(filepath, _backup_extension)
    while os.path.exists(backup_filepath):
      backup_filepath = "%s.%d.%s" %(filepath, i, _backup_extension)
      i += 1

    shutil.move(filepath, backup_filepath)
    sys.stderr.write("Moved %s to %s\n" %(filepath, backup_filepath))


def _copy_to_destination(src_path, dest_path):
  shutil.copyfile(src_path, dest_path)
  sys.stderr.write("Copied a file: %s to %s\n" %(src_path, dest_path))


def _link_to_destination(src_path, dest_path):
  os.symlink(src_path, dest_path)
  sys.stderr.write("Created a symlink: %s to %s\n" %(src_path, dest_path))


def _load_config(conf_filepath):
  try:
    fh = open(conf_filepath, "r")
    data = yaml.load(fh, Loader=yaml.SafeLoader)
    fh.close()
    return data
  except yaml.YAMLError as e:
    sys.stderr.write("Can't read config file %s\nError: %s\n" \
        %(conf_filepath, e))
    exit(1)


def _handle_file(src_path, dest_path, action_type):
  if action_type == "copy":
    _copy_to_destination(src_path, dest_path)
  elif action_type == "symlink":
    _link_to_destination(src_path, dest_path)


def _show_next_steps(suggestions):
  sys.stderr.write("\n\nNext steps:\n")
  for entry in suggestions:
    dest_path = "%s/%s" %(_home_dir, entry["destination_file"])
    sys.stderr.write("%s\n--%s\n\n" %(dest_path, entry["description"]))


if __name__ == "__main__":
  conf_filepath = "%s/%s" %(os.getcwd(), _conf_file)

  data = _load_config(conf_filepath)

  _validate_conf(data)

  _install_dotfiles(data["dotfiles"])

  sys.stderr.write("\n\nInstallation done!\n")
  _show_next_steps(data["suggestions"])
