# scanz

[![scanz icon](images/scanz-icon.svg)](https://github.com/ssent1/misc)

[scanz](https://github.com/ssent1/misc/tree/master/scanz) is a script that makes it easier and faster to bulk scan, **optimize**, and archive documents.\
[scanz](https://github.com/ssent1/misc/tree/master/scanz) deletes temporary scan files and moves minimized versions to archive folder.

[Submit Bug](https://github.com/ssent1/misc/issues) • [Feature Request](https://github.com/ssent1/misc/issues)

---

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]

---

## Contents

1. [About](#about)
   - [Version](#version)
   - [Built With](#built-with)
2. [Getting Started](#getting-started)
   - [Prerequisites](#prerequisites)
   - [Installation](#installation)
3. [Usage](#usage)
4. [Roadmap](#roadmap)
5. [Contributing](#contributing)
6. [License](#license)
7. [Contact](#contact)
8. [Acknowledgements](#acknowledgements)

## About

### Version Info/Change Log

6-Jan-21: created alias to run the `scanz` script from anywhere on the command line.

```sh scanz
# alias
alias scanz='zsh /Users/syd/Code/misc/scanz/scanz.sh'
```

24-Dec-20: initial commit

### Built With

- [zsh](https://github.com/zsh-users/zsh)

## Getting Started

To get a local copy up and running follow these simple steps.

### Prerequisites

This is an example of how to list things you need to use the software and how to install them.

- zsh via Homebrew (recommended)

```sh zsh via Homebrew
brew install zsh
```

- zsh via Github

```sh zsh via Github
git clone https://github.com/zsh-users/zsh.git
```

☛ This script has not been with Bash. It uses Bash-friendly conventioons, so it should work. Before testing, it's necessary to update the usual suspects: shebang (`#! /bin/bash`) or the absolute path to the version of Bash that you're using), variable expansion parameters, etc. in the source code).

### Installation

1. Clone the repo

```sh clone the repo
git clone https://github.com/ssent1/misc.git
```

## Usage

1. Create the following directories:

   ```sh directory structure
   "$HOME"/Downloads/0_rawScan/
   "$HOME"/Downloads/0_rawScan/0_templatize
   "$HOME"/Downloads/0_rawScan/1_binderize
   "$HOME"/Downloads/0_rawScan/2_optimize
   "$HOME"/Downloads/0_rawScan/3_minimize
   "$HOME"/Downloads/0_rawScan/99_trash
   "$HOME"/Downloads/0_rawScan/Ω-archive
   ```

2. Configure your scanner to scan to `"$HOME"/Downloads/0_rawScan/`.
3. Type `scanz` at your command-line prompt.

<!-- ROADMAP -->

## Roadmap

See the [open issues](https://github.com/ssent1/misc/issues) for a list of proposed features (and known issues).

<!-- CONTRIBUTING -->

## Contributing

Contributions make the free open source software (FOSS) community an amazing place to be learn, inspire, and create. Your contributions are **appreciated greatly**.

1. **Fork** the Project
2. **Create** your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. **Commit** your Changes (`git commit -m 'Added an AmazingFeature'`)
4. **Push** to the Branch (`git push origin feature/AmazingFeature`)
5. **Open** a Pull Request

## License

Distributed under the MIT License. See `LICENSE` for more information.

## Contact

[:bird: @SydSalmon](https://twitter.com/SydSalmon)\
[:email: sksalmon@gmail.com](mailto:sksalmon@gmail.com)\
[:link: https://github.com/ssent1/misc](https://github.com/ssent1/misc)

## Acknowledgements

- [GitHub Emoji Cheat Sheet](https://www.webpagefx.com/tools/emoji-cheat-sheet)
- [Img Shields](https://shields.io)
- [Choose an Open Source License](https://choosealicense.com)
- [GitHub Pages](https://pages.github.com)
- [Animate.css](https://daneden.github.io/animate.css)
- [Loaders.css](https://connoratherton.com/loaders)
- [Slick Carousel](https://kenwheeler.github.io/slick)
- [Smooth Scroll](https://github.com/cferdinandi/smooth-scroll)
- [Sticky Kit](http://leafo.net/sticky-kit)
- [JVectorMap](http://jvectormap.com)
- [Font Awesome](https://fontawesome.com)

<!--- GitHub Status Links -->

[contributors-shield]: https://img.shields.io/github/contributors/ssent1/misc.svg?style=for-the-badge
[contributors-url]: https://github.com/ssent1/misc/repo/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/ssent1/misc.svg?style=for-the-badge
[forks-url]: https://github.com/ssent1/misc/repo/network/members
[stars-shield]: https://img.shields.io/github/stars/ssent1/misc.svg?style=for-the-badge
[stars-url]: https://github.com/ssent1/misc/repo/stargazers
[issues-shield]: https://img.shields.io/github/issues/ssent1/misc.svg?style=for-the-badge
[issues-url]: https://github.com/ssent1/misc/repo/issues
[license-shield]: https://img.shields.io/github/license/ssent1/misc.svg?style=for-the-badge
[license-url]: https://github.com/ssent1/misc/blob/master/LICENSE
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=2867B2
[linkedin-url]: https://www.linkedin.com/in/SydSalmon/

---

tags: \
updated: _20210106_231323_
