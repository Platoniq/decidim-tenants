const HOST_REGEX = /smiles\.platoniq\.net|localhost/;

if (window.location.hostname.match(HOST_REGEX)) {
  document.addEventListener('DOMContentLoaded', () => {
    const $processNavRow = $(".process-nav").parent(".row");
    const $processHeaderInner = $(".process-header__inner");

    $processNavRow.prependTo($processHeaderInner);

  })


  const moveMainNav = () => {
    const $mainNav = $(".main-nav");
    const $searchHolder = $(".show-for-medium[data-set='nav-search-holder']");

    $searchHolder.before($mainNav);
  };

  const restoreMainNav = () => {
    const $mainNav = $(".main-nav");
    const $searchHolder = $(".show-for-medium[data-set='nav-search-holder']");

    $searchHolder.before($mainNav);
  };
}
