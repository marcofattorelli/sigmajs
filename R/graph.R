#' Add nodes and edges
#'
#' Add nodes and edges.
#'
#' @param sg An object of class \code{sigmajs}as intatiated by \code{\link{sigmajs}}.
#' @param nodes,edges Data.frame of nodes or edges.
#' @param ... any column.
#'
#' @examples
#' ids <- as.character(1:10)
#'
#' nodes <- data.frame(
#'   id = ids,
#'   label = LETTERS[1:10],
#'   stringsAsFactors = FALSE
#' )
#'
#' edges <- data.frame(
#'   id = 1:15,
#'   source = sample(ids, 15, replace = TRUE),
#'   target = sample(ids, 15, replace = TRUE),
#'   stringsAsFactors = FALSE
#' )
#'
#' sigmajs() %>%
#'   sg_nodes(nodes, id, label) %>%
#'   sg_edges(edges, id, source, target)
#'
#' @rdname graph
#' @export
sg_nodes <- function(sg, nodes, ...){

  nodes <- .build_data(nodes, ...) %>% 
    .check_ids() %>% 
    .check_x_y() %>% 
    .as_list()

  sg$x$data <- append(sg$x$data, list(nodes = nodes))
  sg
}

#' @rdname graph
#' @export
sg_edges <- function(sg, edges, ...){

  edges <- .build_data(edges, ...) %>% 
    .check_ids() %>% 
    .as_list()

  sg$x$data <- append(sg$x$data, list(edges = edges))
  sg
}