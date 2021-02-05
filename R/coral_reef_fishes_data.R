#' coral_reef_fishes_data
#'
#'
#' @details
#' This is the raw data containing otolith measurements provided by:
#' Morat, F., Wicquart, J., Schiettekatte, N. M. D., de Synéty, G., Bienvenu,
#' J., Casey, J. M., Brandl, S. J., Vii, J., Carlot, J., Degregori, S.,
#' Mercière, A., Fey, P., Galzin, R., Letourneur, Y., Sasal, P., Parravicini,
#' V. Individual back-calculated size-at-age based on otoliths from Pacific
#' coral reef fish species. _Scientific Data_, 7, 370 (2020).
#' Please cite this paper when using the data.
#'
#' @format A data frame with 6320 rows and 13 variables.
#' \itemize{
#'   \item family: Fish family.
#'   \item genus: Fish Genus.
#'   \item species: Fish species.
#'   \item id: Unique code identifying each individual.
#'   \item agei: Age i (years).
#'   \item radi: Otolith radius at age i (mm).
#'   \item agecap: Age of the fish at capture (years).
#'   \item radcap: Radius of the otolith at capture (mm).
#'   \item lencap: Length of the fish at capture (total length, mm).
#'   \item l0p: Length of the fish at hatching (mm).
#'   \item weight: Wet body mass of the fish at capture (g).
#'   \item location: Island of the sampling.
#'   \item observer: Name of person who measured the otolith.
#' }
#'
#' @source \href{https://figshare.com/articles/Individual_back-calculated_size-at-age_based_on_otoliths_from_Pacific_coral_reef_fish_species/12156159/5}{figshare}
#'
#' @references Morat et al. (2020) Individual back-calculated size-at-age
#' based on otoliths from Pacific coral reef fish species. Scientific Data, 7,
#' 370 (2020).
#' (\href{https://doi.org/10.1038/s41597-020-00711-y}{ScientificData})
#'
#' @docType data
#'
#' @usage data(coral_reef_fishes_data)
#'
#' @keywords datasets
#'
#' @examples
#' data(coral_reef_fishes_data)
"coral_reef_fishes_data"
